<template>
    <div class="discussion">
      <h1>{{ title }}</h1>
      <p>URL: {{ url }}</p>
      <p>Дата создания: {{ createdAt }}</p>
      <div class="discussion-content">
        <!-- Раздел обсуждения и скриншота -->
      </div>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  
  export default {
    data() {
      return {
        title: '',
        url: '',
        createdAt: '',
      };
    },
    async created() {
      const gen = this.$route.params.gen;
      try {
        const response = await axios.get(`http://localhost:8080/api/discussions/${gen}`);
        const data = response.data;
        this.title = data.title;
        this.url = data.url;
        this.createdAt = data.created_at;
      } catch (error) {
        console.error("Ошибка при загрузке данных обсуждения:", error);
      }
    },
  };
  </script>
  
  <style scoped>
  .discussion {
    padding: 20px;
  }
  </style>
  