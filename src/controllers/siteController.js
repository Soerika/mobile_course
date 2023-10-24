class SiteController {
    index (req, res) {
        res.send('hello from site');
    }
    
    show (req, res) {
        res.send('hello from site');
    }
}

module.exports = new SiteController;