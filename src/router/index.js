// router/index.js
import { createRouter, createWebHistory } from 'vue-router';
import UrlForm from '../components/UrlForm.vue';
import CreateDiscussion from '../components/CreateDiscussion.vue';
import Discussion from '../components/Discussion.vue';

const routes = [
  { path: '/', component: UrlForm },
  { path: '/create-discussion', component: CreateDiscussion },
  { path: '/discussion/:gen', component: Discussion },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
