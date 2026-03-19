import axios from 'axios';

// Create axios instance
const request = axios.create({
  baseURL: import.meta.env.VITE_API_BASE_URL || '/api/v2',
  timeout: 10000,
});

// Request interceptor
request.interceptors.request.use(
  (config) => {
    // Add auth token if exists
    const token = localStorage.getItem('token');
    if (token) {
      config.headers['Authorization'] = `Bearer ${token}`;
    }
    return config;
  },
  (error) => {
    return Promise.reject(error);
  }
);

// Response interceptor
request.interceptors.response.use(
  (response) => {
    const res = response.data;
    // According to our ApiResponse.java structure
    if (res.code !== 200) {
      // Handle business errors
      console.error(res.message);
      return Promise.reject(new Error(res.message || 'Error'));
    }
    return res.data;
  },
  (error) => {
    console.error('Network Error:', error);
    return Promise.reject(error);
  }
);

export default request;
