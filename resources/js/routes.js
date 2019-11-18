import Vue from 'vue';
import VueRouter from 'vue-router';

import Home from '@/js/components/Home';
import Redeem from '@/js/components/Redeem';

Vue.use(VueRouter);

const router = new VueRouter({
	mode: 'history',
	routes: [
		{
			path: '/',
			name: 'home',
			component: Home
		},
		{
			path: '/redeem',
			name: 'redeem',
			component: Redeem
		}
	]
});

export default router;