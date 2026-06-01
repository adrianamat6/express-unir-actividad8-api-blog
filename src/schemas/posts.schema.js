const yup = require('yup');

const postSchema = yup.object().shape({
    titulo: yup
        .string()
        .trim()
        .min(3, 'El título debe tener al menos 3 caracteres')
        .max(100, 'El título no puede superar los 100 caracteres')
        .required('El título es obligatorio'),
    descripcion: yup
        .string()
        .trim()
        .min(10, 'La descripción debe tener al menos 10 caracteres')
        .required('La descripción es obligatoria'),
    categoria: yup
        .string()
        .trim()
        .required('La categoría es obligatoria'),
    autor_id: yup
        .number()
        .integer('El ID del autor debe ser un número entero')
        .positive('El ID del autor debe ser un número positivo') // Evita números negativos o cero
        .required('El ID del autor es obligatorio')
});

module.exports = {
    postSchema
};