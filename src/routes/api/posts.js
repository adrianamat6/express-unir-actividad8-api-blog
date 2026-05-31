const router = require('express').Router();
const { getAllPosts, createPost, getPostsByAuthor } = require('../../controllers/posts.controller');
const { checkPostData, checkAuthorExists } = require('../../middleware/validators.middleware');


router.get('/', getAllPosts);
router.get('/autor/:autorId', checkAuthorExists, getPostsByAuthor); 
router.post('/', checkPostData, checkAuthorExists, createPost);

module.exports = router;