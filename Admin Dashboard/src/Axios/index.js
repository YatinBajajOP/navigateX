import axios from 'axios'

const AxiosExceptionHandler = async (func, endpoint, setHeaders, body) => {
    headers = setHeaders ? {
        headers: {
            Authorization: `Bearer ${token}`
        }
    } : null
    try{
        func(`${import.meta.env.VITE_BACKEND_URI}${endpoint}`, headers, body);
    } catch(e) {
        console.log(e)
    } finally {

    }
}

const get = async (endpoint, headers) => {
    return axios.get(endpoint, headers)
}

const post = async (endpoint, headers, body) => {
    return axios.post(endpoint, body, headers)
}

const CustomAxios = {
    get: async (endpoint, setHeaders = true) => AxiosExceptionHandler(get, endpoint, setHeaders),
    post: async (endpoint, body, setHeaders = true) => AxiosExceptionHandler(post, endpoint, setHeaders, body)
}

export default CustomAxios