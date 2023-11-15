const Review = require('../models/reviews')

class ReviewController {
    // GET /
    index(req, res, next) {
        Review.find({}).limit(10).sort({})
            .then(reviews => res.status(200).json(reviews))
            .catch(next);
    }

    // GET /:id
    show(req, res, next) {
        Review.find({
            userId: req.params.id
        })
            .limit(10)
            .exec()
            .then((reviews) => {
                console.log(reviews);
                res.status(200).json(reviews)
            })
            .catch(next);
    }

    // POST /:id
    review(req, res, next) {
        const data = Object.assign({userId: req.params.id}, req.body);

        // validation
        console.log(data)
        const newReview = new Review(
            data
        )
        newReview.save();

        res.status(200).json(data);
    }
}

module.exports = new ReviewController;