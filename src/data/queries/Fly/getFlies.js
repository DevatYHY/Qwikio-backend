import FlyData from "../../types/GetFlyType";
import { Fly } from "../../models";

const getFlies = {
    type: FlyData,

    async resolve({ request }) {
        try {
            const records = await Fly.findAll();
         
            return {
                results: records,
                status: 200,
            };
        } catch (error) {
            return {
                errorMessage: "Something went wrong" + error,
                status: 400,
            };
        }
    },
};

export default getFlies;
