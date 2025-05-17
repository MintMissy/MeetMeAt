import { Routes } from '@angular/router';

export const routes: Routes = [
	{
		path: '',
		loadComponent: () =>
			import('./meetups/containers/search-page/meetup-search.ng'),
	},
	{
		path: 'meetup/:id',
		loadComponent: () =>
			import('./meetups/containers/meetup-page/meetup-page.ng'),
	},
	{
		path: '**',
		loadComponent: () => import('./common/containers/not-found-page.ng'),
	},
];
