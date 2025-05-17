import { CardModule } from 'primeng/card';
import { TagModule } from 'primeng/tag';

import { DatePipe } from '@angular/common';
import { Component, input } from '@angular/core';
import { ChangeDetectionStrategy } from '@angular/core';

import type { MeetupCategory } from '../../../types/meetup-category.type';

@Component({
	selector: 'app-meetup-details',
	template: `
		<p-card>
			<ng-template #title>
				<div class="flex items-center justify-between">
					Details
					<p-tag [value]="category()" severity="info" />
				</div>
			</ng-template>
			<ng-template #subtitle> Organized by {{ organizer() }} </ng-template>

			<div class="space-y-4">
				<div class="flex items-center gap-2">
					<i class="pi pi-calendar text-primary"></i>
					<span>{{ date() | date: 'mediumDate' }}</span>
				</div>

				<div class="flex items-center gap-2">
					<i class="pi pi-map-marker text-primary"></i>
					<span>{{ city() }}, {{ meetupLocation() }}</span>
				</div>
			</div>
		</p-card>
	`,
	changeDetection: ChangeDetectionStrategy.OnPush,
	imports: [CardModule, TagModule, DatePipe],
})
export default class MeetupDetailsComponent {
	readonly category = input<MeetupCategory>();
	readonly date = input<string>();
	readonly city = input<string>();
	readonly meetupLocation = input<string>();
	readonly organizer = input<string>();
}
