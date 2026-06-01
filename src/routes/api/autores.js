const router = require('express').Router();
const { getAllAuthors, createAuthor } = require('../../controllers/autores.controller');
const { validateSchema } = require('../../middleware/validation.middleware'); // <-- Actualizado
const { autorSchema } = require('../../schemas/autores.schema');

router.get('/', getAllAuthors);
router.post('/', validateSchema(autorSchema), createAuthor);

module.exports = router;