<template>
    <div>
      <h2>Создание обсуждения для {{ url }}</h2>
      <p v-if="errorMessage">{{ errorMessage }}</p>
      <p v-if="loading">Пожалуйста, подождите...</p>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  export default {
    data() {
      return {
        url: '',
        loading: true,
        errorMessage: '',
      };
    },
    async created() {
      this.url = this.$route.query.url; // Получаем URL из параметров запроса
  
      try {
        const response = await axios.post('http://localhost:8080/api/create-discussion', {
          url: this.url,
        });
        const gen = response.data.gen; // Получаем уникальный идентификатор
        this.$router.push(`/discussion/${gen}`); // Перенаправляем на страницу обсуждения
      } catch (error) {
        this.errorMessage = 'Произошла ошибка при создании обсуждения.';
        console.error(error);
      } finally {
        this.loading = false;
      }
    },
  };
  </script>
  
  <style scoped>
  /* Добавьте стили, если нужно */
  </style>
  