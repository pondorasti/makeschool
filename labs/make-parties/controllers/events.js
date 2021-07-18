

module.exports = (app, models) => {

  // EVENTS#INDEX (HOME) (GET)
  app.get('/', (req, res) => {
    models.Event.findAll({ order: [['createdAt', 'DESC']] }).then(events => {
      res.render('events-index', { events: events });
    })
  })

  // EVENTS#NEW (GET)
  app.get('/events/new', (req, res) => {
    res.render(`events-new`);
  })

  // EVENTS#CREATE (POST)
  app.post('/events', (req, res) => {
    models.Event.create(req.body).then(event => {
      res.redirect(`/events/${event.id}`);
    }).catch((err) => {
      console.log(err)
    });
  });

  // EVENTS#SHOW
  app.get('/events/:id', (req, res) => {
    // models.Event.findById(req.params.id, { include: [ { model: models.Comment }, { model: models.Rspv }] } ).then(event => {
    // models.Event.findById(req.params.id, { include: [ { all:true }] } ).then(event => {
    //   console.log(event)
    //   res.render('events-show', { event: event });
    // });

    models.Event.findById(req.params.id).then(event => {
      event.getComments({ order: [ ['createdAt', 'DESC'] ] }).then(comments => {
        event.getRsvps({ order: [ ['createdAt', 'DESC'] ] }).then(rsvps => {
          res.render('events-show', { comments: comments, event: event, rsvps: rsvps });
        });
      });
    });

    // let event = await models.Event.findById(req.params.id)
    // let comments = event.getComments({ order: [ ['createdAt', 'DESC'] ] });
    // let rsvps = event.getRsvps()
    // res.render('events-show', { comments: comments, event: event, rsvps: rsvps });
  });

  // EVENTS#EDIT
  app.get('/events/:id/edit', (req, res) => {
    models.Event.findById(req.params.id).then((event) => {
      res.render('events-edit', { event: event });
    });
  });

  // EVENTS#UPDATE
  app.put('/events/:id', (req, res) => {
    models.Event.findById(req.params.id).then(event => {
      event.update(req.body).then(event => {
        res.redirect(`/events/${req.params.id}`);
      }).catch((err) => {
        console.log(err);
      });
    });
  });

  // EVENTS#DESTROY
  app.delete('/events/:id', (req, res) => {
    models.Event.findById(req.params.id).then(event => {
      event.destroy();
      res.redirect(`/`);
    });
  })
}
