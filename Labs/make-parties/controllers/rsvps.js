

module.exports = (app, models) => {

  // RSVPS#NEW
  app.get('/events/:eventId/rsvps/new', (req, res) => {
    models.Event.findById(req.params.eventId).then(event => {
      res.render('rsvps-new', { event: event });
    });
  });

  // RSVPS#CREATE
  app.post('/events/:eventId/rsvps', (req, res) => {
    req.body.EventId = req.params.eventId;
    models.Rsvp.create(req.body).then(rsvp => {
      res.redirect(`/events/${req.params.eventId}`);
    });
  });

  // RSVPS#DELETE
  app.delete('/events/:eventId/rsvps/:id', (req, res) => {
    models.Rsvp.findById(req.params.id).then(rsvp => {
      rsvp.destroy();
      res.redirect(`/events/${req.params.eventId}`);
    });
  });

}
