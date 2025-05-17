import { injectParams } from 'ngxtension/inject-params';
import { ConfirmationService } from 'primeng/api';
import { ButtonModule } from 'primeng/button';
import { CardModule } from 'primeng/card';
import { ConfirmDialog } from 'primeng/confirmdialog';
import { ProgressSpinnerModule } from 'primeng/progressspinner';
import { TagModule } from 'primeng/tag';

import {
	ChangeDetectionStrategy,
	Component,
	DestroyRef,
	inject,
	signal,
} from '@angular/core';
import { takeUntilDestroyed } from '@angular/core/rxjs-interop';
import { Router, RouterLink } from '@angular/router';

import { MeetupDialogComponent } from '../../dialogs/meetup-dialog.ng';
import { MeetupsService } from '../../services/meetups.service';
import MeetupDescriptionComponent from './components/meetup-description.ng';
import MeetupDetailsComponent from './components/meetup-details.ng';
import MeetupHeaderComponent from './components/meetup-header.ng';

@Component({
	selector: 'app-meetup-page',
	templateUrl: './meetup-page.html',
	changeDetection: ChangeDetectionStrategy.OnPush,
	imports: [
		CardModule,
		ButtonModule,
		TagModule,
		MeetupDialogComponent,
		ProgressSpinnerModule,
		RouterLink,
		ConfirmDialog,
		MeetupDescriptionComponent,
		MeetupDetailsComponent,
		MeetupHeaderComponent,
	],
	providers: [ConfirmationService],
})
export default class MeetupPageComponent {
	readonly #confirm = inject(ConfirmationService);
	readonly #meetupsService = inject(MeetupsService);
	readonly #destroyRef = inject(DestroyRef);
	readonly #router = inject(Router);

	readonly meetupId = injectParams((params) => params?.['id']);

	readonly meetup = this.#meetupsService.getMeetup(this.meetupId);

	readonly editDialogOpen = signal(false);

	onEdit() {
		this.editDialogOpen.set(true);
	}

	onDelete(event: Event) {
		this.#confirm.confirm({
			target: event.target as EventTarget,
			message: 'Are you sure you want to delete this meetup?',
			header: 'Are you sure?',
			rejectLabel: 'Cancel',
			rejectButtonProps: {
				label: 'Cancel',
				severity: 'secondary',
				outlined: true,
			},
			acceptButtonProps: {
				label: 'Delete',
				severity: 'danger',
			},
			accept: () => {
				this.#meetupsService
					.deleteMeetup(this.meetupId())
					.pipe(takeUntilDestroyed(this.#destroyRef))
					.subscribe(() => {
						this.#router.navigate(['/']);
						this.#meetupsService.meetups.reload();
					});
			},
		});
	}

	refreshMeetup(): void {
		this.meetup.reload();
	}
}
