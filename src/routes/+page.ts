import type { PageLoad } from './$types';

export const load: PageLoad = async ({ fetch }) => {
    const endpoint = `/api/example-endpoint`
    
    try {
        const res = await fetch(endpoint, {});
        if (res.ok) {
            return {
                value: await res.text()
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