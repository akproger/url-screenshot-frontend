<template>
    <div class="url-form">
      <h1>Введите URL для создания обсуждения</h1>
      <input v-model="url" placeholder="Введите URL" />
      <button @click="submitUrl">Далее</button>
      <p v-if="errorMessage">{{ errorMessage }}</p>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  
  export default {
    data() {
      return {
        url: '',
        errorMessage: '',
      };
    },
    methods: {
      async submitUrl() {
        try {
          const response = await axios.post('http://localhost:8080/api/check-url', { url: this.url });
          if (response.data.exists) {
            // Переход к существующей странице обсуждения
            this.$router.push(`/discussion/${response.data.gen}`);
          } else {
            // Переход к процессу создания нового обсуждения
            this.$router.push(`/create-discussion?url=${encodeURIComponent(this.url)}`);
          }
        } catch (error) {
          this.errorMessage = 'Произошла ошибка. Пожалуйста, попробуйте снова.';
          console.error(error);
        }
      },
    },
  };
  </script>
  
  <style>
  .url-form {
    /* стиль формы */
  }
  </style>
  