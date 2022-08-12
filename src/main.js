const app = require('./app');
const config = require('./app/config');
const { logger } = require('./app/logger');

// 开启服务器
app.listen(config.APP_PORT, config.APP_HOST, () => {
  logger.info(`服务器启动成功，端口号为：${config.APP_PORT}`);
});
