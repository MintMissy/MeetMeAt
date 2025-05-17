import { ButtonModule } from 'primeng/button';
import { CalendarModule } from 'primeng/calendar';
import { DialogModule } from 'primeng/dialog';
import { DropdownModule } from 'primeng/dropdown';
import { InputTextModule } from 'primeng/inputtext';
import { TextareaModule } from 'primeng/textarea';
import { catchError, of } from 'rxjs';

import {
	ChangeDetectionStrategy,
	Component,
	DestroyRef,
	effect,
	inject,
	input,
	output,
	signal,
} from '@angular/core';
import { takeUntilDestroyed } from '@angular/core/rxjs-interop';
import {
	FormBuilder,
	FormGroup,
	ReactiveFormsModule,
	Validators,
} from '@angular/forms';

import { MeetupsService } from '../services/meetups.service';
import type { MeetupCategory } from '../types/meetup-category.type';
import type { Meetup } from '../types/meetup.type';

interface MeetupCategoryOption {
	label: string;
	value: MeetupCategory;
}

@Component({
	selector: 'app-meetup-dialog',
	standalone: true,
	imports: [
		DialogModule,
		ButtonModule,
		InputTextModule,
		DropdownModule,
		CalendarModule,
		ReactiveFormsModule,
		TextareaModule,
	],
	templateUrl: './meetup-dialog.html',
	changeDetection: ChangeDetectionStrategy.OnPush,
})
export class MeetupDialogComponent {
	readonly #fb = inject(FormBuilder);
	readonly #meetupsService = inject(MeetupsService);
	readonly #destroyRef = inject(DestroyRef);

	readonly open = input.required<boolean>();
	readonly meetup = input<Meetup | null | undefined>();

	readonly close = output<void>();
	readonly editMeetup = output<void>();

	readonly isSubmitting = signal(false);

	readonly categories: MeetupCategoryOption[] = [
		{ label: 'Programming', value: 'programming' },
		{ label: 'Design', value: 'design' },
		{ label: 'Marketing', value: 'marketing' },
		{ label: 'Business', value: 'business' },
		{ label: 'Finance', value: 'finance' },
		{ label: 'Other', value: 'other' },
	];

	readonly form: FormGroup = this.#fb.group({
		title: ['', [Validators.required, Validators.minLength(3)]],
		description: ['', [Validators.required, Validators.minLength(10)]],
		date: [null as Date | null, Validators.required],
		organizer: ['', Validators.required],
		city: ['', Validators.required],
		meetupLocation: ['', Validators.required],
		category: [null as MeetupCategory | null, Validators.required],
	});

	constructor() {
		effect(() => {
			const meetup = this.meetup();
			if (meetup) {
				this.form.patchValue({
					...meetup,
					date: new Date(meetup.date),
				});
			}
		});
	}

	onVisibleChange(visible: boolean) {
		if (!visible) {
			this.form.reset();
			this.close.emit();
		}
	}

	onCancel() {
		this.close.emit();
	}

	onSubmit() {
		if (this.form.invalid) {
			return;
		}

		this.isSubmitting.set(true);
		const formValue = this.form.value;
		const meetupData = {
			...formValue,
			date: formValue.date.toISOString(),
		};

		if (this.meetup()) {
			this.#meetupsService
				.editMeetup({
					...meetupData,
					id: this.meetup()?.id,
				})
				.pipe(
					catchError((error) => {
						console.error(error);
						this.isSubmitting.set(false);
						return of(null);
					}),
					takeUntilDestroyed(this.#destroyRef),
				)
				.subscribe(() => {
					this.close.emit();
					this.editMeetup.emit();
					this.isSubmitting.set(false);
				});
		} else {
			this.#meetupsService
				.createMeetup(meetupData)
				.pipe(
					catchError((error) => {
						console.error(error);
						this.isSubmitting.set(false);
						return of(null);
					}),
					takeUntilDestroyed(this.#destroyRef),
				)
				.subscribe(() => {
					this.close.emit();
					this.isSubmitting.set(false);
				});
		}
	}
}
