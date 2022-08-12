module.exports = {
  apps: [
    {
      name: 'vue3-cms-koa',
      script: './src/main.js',
      cwd: './',
      watch: true,
      ignore_watch: ['logs', 'src/public', '.git'],
      env_production: {
        NODE_ENV: 'production'
      }
    }
  ]
}
