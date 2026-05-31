const router = require('express').Router();
const { getAllAuthors, createAuthor } = require('../../controllers/autores.controller');

router.get('/', getAllAuthors);
router.post('/', createAuthor);

module.exports = router;