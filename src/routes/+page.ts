import { API_URL } from '$app/env/public';
import type { PageLoad } from './$types';

export const load: PageLoad = async () => {
    const endpoint = `${API_URL}/api`
    
    try {
        const res = await fetch(endpoint, {});
        if (res.ok) {
            return {
                value: res.text()
            };
        }
        
        return {
            value: `${res.status} ${res.statusText} at ${endpoint}`
        }
    }
    catch (error) {
        return {
            value: `${error} at ${endpoint}`
        };  
    }
}