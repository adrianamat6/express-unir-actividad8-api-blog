const yup = require('yup');

const autorSchema = yup.object().shape({
    nombre: yup
        .string()
        .trim()
        .required('El nombre es obligatorio'),
    email: yup
        .string()
        .trim()
        .email('El email tiene un formato no válido')
        .matches(/^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i, 'El email tiene un formato no válido')
        .required('El email es obligatorio'),
    imagen: yup
        .string()
        .url('La imagen debe ser una URL válida')
        // Este regex valida que la URL termine en un formato de imagen conocido
        .matches(/\.(jpeg|jpg|gif|png|webp|svg)$/i, 'La URL debe apuntar a una imagen válida (jpg, png, webp...)')
        .nullable()
});

module.exports = {
    autorSchema
};