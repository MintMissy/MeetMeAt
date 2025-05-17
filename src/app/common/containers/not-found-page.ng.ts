import { ChangeDetectionStrategy, Component } from '@angular/core';

@Component({
	selector: 'app-not-found-page',
	template: ` <h1>Not Found</h1> `,
	changeDetection: ChangeDetectionStrategy.OnPush,
})
export default class NotFoundPageComponent {}
