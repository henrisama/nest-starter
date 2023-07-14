import { NestFactory } from '@nestjs/core';
import { AppModule } from './modules/app/app.module';
import nestconf from './config/nest.conf';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  await app.listen(nestconf.port);
}
bootstrap();
