const { cwd } = require('node:process');


function getIconPath(path) {
    return cwd() + path
}

class PublicController {
    // GET /icons/:slug
    icon(req, res, next) {
        return res.status(200).sendFile(getIconPath('/public/icons/' + req.params.slug));
    }

}

module.exports = new PublicController;