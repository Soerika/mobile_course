const { cwd } = require('node:process');
const path = require('path');

const Resize = require( '../helper/resize');

function getIconPath(path) {
    return cwd() + path
}

class PublicController {
    // GET /icons/:slug
    icon(req, res, next) {
        return res.status(200).sendFile(getIconPath('/public/icons/' + req.params.slug));
    }

    // GET /avatar/:id
    avatar(req, res, next) {
        return res.status(200).sendFile(getIconPath('/public/avatars/' + req.params.id));
    }

    // POST /avatar/:id
    async updateAvatar(req, res, next) {
        console.log(req.params.id);

        // folder upload
        const imagePath = path.join(cwd(), '/public/avatars');
        // call class Resize
        const fileUpload = new Resize(imagePath);
        if (!req.file) {
            res.status(401).json({error: 'Please provide an image'});
        }
        const filename = await fileUpload.save(req.file.buffer, req.params.id);
        
        return res.status(200).json({ name: filename });
    }
}

module.exports = new PublicController;