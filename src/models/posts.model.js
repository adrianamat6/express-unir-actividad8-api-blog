const db = require('../config/db');

// Obtener todos los posts con la información de su autor
const getAllWithAuthor = async () => {
    const query = `
        SELECT p.*, a.nombre AS autor_nombre, a.email AS autor_email, a.imagen AS autor_imagen 
        FROM posts p 
        JOIN autores a ON p.autor_id = a.id
    `;
    const [result] = await db.query(query);
    return result;   
};

const getById = async (postId) => {
    const query = `
        SELECT p.*, a.nombre AS autor_nombre, a.email AS autor_email, a.imagen AS autor_imagen 
        FROM posts p 
        JOIN autores a ON p.autor_id = a.id
        WHERE p.id = ?
    `;
    const [result] = await db.query(query, [postId]);
    if (result.length === 0) return null;
    return result[0];
};

// Obtener posts escritos por un autor específico
const getByAuthorId = async (autorId) => {
    const query = `
        SELECT p.*, a.nombre AS autor_nombre, a.email AS autor_email, a.imagen AS autor_imagen 
        FROM posts p 
        JOIN autores a ON p.autor_id = a.id 
        WHERE p.autor_id = ?
    `;
    const [result] = await db.query(query, [autorId]);
    return result;
};

// Crear un nuevo post
const create = async ({ titulo, descripcion, categoria, autor_id }) => {
    const [result] = await db.query(
        'INSERT INTO posts (titulo, descripcion, categoria, autor_id) VALUES (?, ?, ?, ?)',
        [titulo, descripcion, categoria, autor_id]
    );
    return result;
};



module.exports = { getAllWithAuthor, getById, getByAuthorId, create};