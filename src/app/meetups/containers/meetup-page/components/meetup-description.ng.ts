import { CardModule } from 'primeng/card';

import { ChangeDetectionStrategy, input } from '@angular/core';
import { Component } from '@angular/core';

@Component({
	selector: 'app-meetup-description',
	template: ` <p-card class="mt-6 block">
		<ng-template #title>
			<h2 class="text-xl font-semibold">Description</h2>
		</ng-template>
		<p class="whitespace-pre-wrap text-gray-400">
			{{ description() }}
		</p>
	</p-card>`,
	imports: [CardModule],
	changeDetection: ChangeDetectionStrategy.OnPush,
})
export default class MeetupDescriptionComponent {
	readonly description = input<string>();
}
