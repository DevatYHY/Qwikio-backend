import StayData from "../../types/GetStayType";
import { Stay } from "../../models";

const getStays = {
    type: StayData,

    async resolve({ request }) {
        try {
            const records = await Stay.findAll();
         
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

export default getStays;
