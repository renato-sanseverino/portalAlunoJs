import axios from 'axios'
import { Dialog } from '@mui/material'
import Draggable from 'react-draggable'
import { useState, useEffect } from 'react'
import toast, { Toaster } from 'react-hot-toast'
import { notification } from '../utils/defaults'



// Bug ao fazer o upload de foto encontrado:
// PayloadTooLargeError: request entity too large

// Para fazer o upload para o MySQL é necessário aumentar o tamanho do packet
// SET GLOBAL max_allowed_packet = 850741824

// Alterar no Express o limite

export default function TeacherForm({id, parentRef}) {
	const [open, setOpen] = useState(true);

	const close = () => {
		setOpen(false);
	}

	const [professor, setProfessor] = useState({
        "nome": "",
        "email": "",
        "foto": "",
        "formatoImagem": ""
	})

	const handleSubmit = async (e) => {
		e.preventDefault();

		if (professor.nome === "" || professor.email === "" || professor.foto === "") {
			toast.error('Alguns campos obrigatórios não foram preenchidos!', notification.options);
			return;
		}

		try {
			if (id === undefined) {
				await axios.post("/api/routes/professores", {
					...professor,
				})
			} else {
				await axios.put("/api/routes/professores/" + id, {
					...professor,
				})
			}
		} catch (error) {
			toast.error(error.message, notification.options);
			return;
		}

		toast.success('Registro salvo com sucesso', notification.options);
		parentRef.getProfessores();  // Refresh da lista de professores
		close();
	}

	const onChange = (e) => {
		if (e.target.type === 'file') {
			const file = e.target.files[0];
			// Reads the file using the FileReader API
			const reader = new FileReader();
			reader.onloadend = () => {
				const fileData = reader.result.split(';base64,');
				let formato = fileData[0].replace('data:', '') + ';base64'
				setProfessor({...professor, 'foto': fileData[1], 'formatoImagem': formato, })
			}
			reader.readAsDataURL(file);
		}

		setProfessor({...professor, [e.target.name]: e.target.value, })
	}

	useEffect(() => {
		const getProfessor = async (id) => {
			const { data: professor } = await axios.get("/api/routes/professores/" + id);
			setProfessor(professor);
		};

		if (id !== undefined) getProfessor(id);
	}, []);

	return (
	<>
		<Toaster />

		<Draggable>
		<Dialog open={open} onClose={close} BackdropProps={{ style: { backgroundColor: "transparent" } }} >
			<form onSubmit={handleSubmit} className="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
				<div className="mb-4">
					<label htmlFor="nome" className="block text-gray-700 text-sm font-bold md-2">
						Nome
					</label>
					<input type="text"
						name="nome"
						value={professor.nome}
						className="shadow appearance  border rounded py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
						onChange={onChange}
					/>
				</div>

				<div className="mb-4">
					<label htmlFor="email" className="block text-gray-700 text-sm font-bold md-2">
						E-mail
					</label>
					<input type="text"
						name="email"
						value={professor.email}
						className="shadow appearance  border rounded py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
						onChange={onChange}
					/>
				</div>
				<div className="mb-4">
					<label htmlFor="foto" className="block text-gray-700 text-sm font-bold md-2">
						Foto
					</label>
					<div className="bg-gray-400 flex flex-col w-48">
						<input type="file" name="foto" accept=".gif,.jpg,.jpeg,.png" onChange={onChange} />
						<img className="w-full" src={"data:" + professor.formatoImagem + ", " + professor.foto} alt={professor.nome}></img>
					</div>
				</div>
				<input type="hidden" name="formatoImagem" value={professor.formatoImagem} onChange={onChange} />

				<button type="submit" className="bg-blue-500 hover:bg-blue-700 py-2 px-4 rounded focus:outline-none focus:shadow-outline text-white font-bold">
					Salvar
				</button>
			</form>
		</Dialog>
		</Draggable>
	</>
	)
}
