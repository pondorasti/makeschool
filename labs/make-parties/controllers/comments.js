

module.exports = (app, models) => {

  // COMMENTS#CREATE
  app.post('/events/:eventId/comments', (req, res) => {
    models.Event.findById(req.params.eventId).then(event => {
      req.body.EventId = event.id;
      models.Comment.create(req.body).then(comment => {
        res.redirect(`/events/${req.params.eventId}`);
      }).catch((err) => {
        console.log(err)
      });
    });
  });

  // COMMENTS#CREATE ASYNC
  // app.post('/events/:eventId/comments', async (req, res) => {
  //  let event = await models.Event.findOne({ where: { eventId: req.params.eventId }});
  //  req.body.EventId = event.id;
  //  try {
  //    let comment = await models.Comment.create(req.body);
  //  } catch (err) {
  //    console.log(err)
  //  }
  //
  //  res.redirect(`/events/${req.params.eventId}`);
  // })

  // COMMENTS#DESTROY
  app.delete('/events/:eventId/comments/:id', (req, res) => {
    models.Comment.findById(req.params.id).then(comment => {
      comment.destroy();
      res.redirect(`/events/${req.params.eventId}`);
    });
  });
}
