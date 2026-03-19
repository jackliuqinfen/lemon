import { createRouter, createWebHistory } from 'vue-router';
import MainLayout from '../layout/MainLayout.vue';

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      component: MainLayout,
      redirect: '/pm/project-360',
      children: [
        {
          path: 'pm/project-360',
          name: 'Project360',
          component: () => import('../../frontend/src/views/pm/Project360View.vue'),
          meta: { title: '项目全景看板', icon: 'dashboard' }
        },
        {
          path: 'scm/material-recon',
          name: 'MaterialRecon',
          component: () => import('../../frontend/src/views/scm/MaterialRecon.vue'),
          meta: { title: '物资对账台', icon: 'cart' }
        }
      ]
    }
  ]
});

export default router;
