import { ButtonModule } from 'primeng/button';

import {
	ChangeDetectionStrategy,
	Component,
	inject,
	signal,
} from '@angular/core';

import { MeetupCardComponent } from '../../components/meetup-card.ng';
import { MeetupCardLoaderComponent } from '../../components/meeup-card.loader';
import { MeetupDialogComponent } from '../../dialogs/meetup-dialog.ng';
import { MeetupsService } from '../../services/meetups.service';

@Component({
	selector: 'app-meetup-search-page',
	templateUrl: './meetup-search.html',
	changeDetection: ChangeDetectionStrategy.OnPush,
	imports: [
		MeetupCardComponent,
		MeetupCardLoaderComponent,
		ButtonModule,
		MeetupDialogComponent,
	],
})
export default class MeetupSearchPageComponent {
	readonly #meetupsService = inject(MeetupsService);

	readonly meetups = this.#meetupsService.meetups;

	readonly addDialogOpen = signal(false);
}
