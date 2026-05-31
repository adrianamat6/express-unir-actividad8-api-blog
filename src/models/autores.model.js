const db = require('../config/db');

// Obtener todos los autores
const getAll = async () => {
    const [result] = await db.query('SELECT * FROM autores');
    return result;
};

// Obtener un autor por su ID
const getById = async (autorId) => {
    const [result] = await db.query('SELECT * FROM autores WHERE id = ?', [autorId]);
    if (result.length === 0) return null;
    return result[0];
};

// Crear un nuevo autor
const create = async ({ nombre, email, imagen }) => {
    const [result] = await db.query(
        'INSERT INTO autores (nombre, email, imagen) VALUES (?, ?, ?)',
        [nombre, email, imagen]
    );
    return result.insertId;
};


module.exports = { getAll, getById, create };