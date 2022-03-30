This is the repository for my bookings and reservations project.

Dependencies:

- [chi router](https://github.com/go-chi/chi)
- [alex edwards SCS](https://github.com/alexedwards/scs/v2) session management
- [nosurf](https://github.com/justinas/nosurf)
- [pgx](https://github.com/jackc/pgx/v4)
- [simple mail](https://github.com/xhit/go-simple-mail/v2)
- [Go validator](https://github.com/asaskevich/govalidator)
- [Buffalo - Database](https://gobuffalo.io/en/docs/db/getting-started/)
  - generate configuration
  ```soda g config```

  - create fizz migration files
  ```soda generate fizz UsersTable```

  - create sql migration files
  ```soda generate sql UsersTable```

  - run migration up
  ```soda migrate up``` or
  ```soda migrate```

  - run migration down
  ```soda migrate down```

  - run run all down and the all up migrations
  ```soda reset```