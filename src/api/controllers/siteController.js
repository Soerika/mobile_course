class SiteController {
    index (req, res) {
        res.send('hello from site');
    }
}

module.exports = new SiteController;