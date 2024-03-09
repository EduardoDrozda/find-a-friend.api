import { app } from './app'
import { env } from './env'

app
  .listen({
    host: env.APP_HOST,
    port: env.APP_PORT,
  })
  .then((address: string) => {
    console.log(`Server listening at ${address}`)
  })
  .catch((err: Error) => {
    console.error(err)
    process.exit(1)
  })
