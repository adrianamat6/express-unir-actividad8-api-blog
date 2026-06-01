const router = require('express').Router();
const { getAllPosts, createPost, getPostsByAuthor } = require('../../controllers/posts.controller');
const { validateSchema } = require('../../middleware/validation.middleware'); // <-- Actualizado
const { checkAuthorExists } = require('../../middleware/autores.middleware'); // <-- Actualizado
const { postSchema } = require('../../schemas/posts.schema');

router.get('/', getAllPosts);
router.get('/autor/:autorId', checkAuthorExists, getPostsByAuthor); 
router.post('/', validateSchema(postSchema), checkAuthorExists, createPost);

module.exports = router;