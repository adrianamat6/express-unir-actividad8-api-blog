const PostsModel = require('../models/posts.model');
const AutoresModel = require('../models/autores.model');

const getAllPosts = async (req, res) => {
    try {
        const posts = await PostsModel.getAllWithAuthor();
        res.json(posts);
    } catch (error) {
        res.status(500).json({  error: 'Error interno del servidor'  });
    }
};


const getPostsByAuthor = async (req, res) => {
    try {
        const { autorId } = req.params;
        const posts = await PostsModel.getByAuthorId(autorId);
        res.json(posts);
    } catch (error) {
        console.error('Error al obtener posts por autor:', error);
        res.status(500).json({ error: 'Error interno del servidor' });
    }
};

const createPost = async (req, res) => {
    try {
        const result = await PostsModel.create(req.body);
        
        res.status(201).json({ 
            message: 'Post creado con éxito', 
            post: {
                id: result.insertId,
                ...req.body
            }
        });
    } catch (error) {
        console.error('Error al crear post:', error);
        res.status(500).json({ error: 'Error interno del servidor' });
    }
};


module.exports = { getAllPosts, createPost, getPostsByAuthor };