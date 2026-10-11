import { defineEnvVars } from '@sveltejs/kit/env';

export const variables = defineEnvVars({
    BUILD_TIME_VAR : {
        public: true,
        static: true
    }
});