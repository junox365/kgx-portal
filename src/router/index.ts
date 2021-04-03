import { createWebHistory, createRouter } from "vue-router"
import About from "../pages/About.vue"
import Home from "../pages/Home.vue"
import Login from "../pages/Login.vue"

const routes = [
  {
      path: '/',
      name: 'Home',
      component: Home
  },
  {
    path: '/about',
    name: 'About',
    component: About
  },
  {
    path: '/login',
    name: 'Login',
    component: Login
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router