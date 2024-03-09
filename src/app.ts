import fastify from 'fastify'
import { routes } from './http/routes'
import { ZodError } from 'zod'
import { env } from './env'
import { HttpStatusEnum } from './shared/enums'

const app = fastify()

app.register(routes)

app.setErrorHandler((error, request, reply) => {
  if (error instanceof ZodError) {
    return reply
      .status(HttpStatusEnum.UNPROCESSABLE_ENTITY)
      .send({ message: 'Validation error.', issues: error.format() })
  }

  if (env.NODE_ENV !== 'production') {
    console.error(error)
  }

  return reply.status(500).send({ message: 'Internal server error.' })
})

export { app }
