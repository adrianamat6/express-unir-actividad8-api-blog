const router = require('express').Router();
const { getAllAuthors, createAuthor } = require('../../controllers/autores.controller');
const { checkAuthorData } = require('../../middleware/validators.middleware');

router.get('/', getAllAuthors);
router.post('/', checkAuthorData, createAuthor);

module.exports = router;