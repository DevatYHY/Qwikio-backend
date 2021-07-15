import RentData from "../../types/GetRentType";
import { Rent } from "../../models";

const getRents = {
    type: RentData,

    async resolve({ request }) {
        try {
            const records = await Rent.findAll();
         
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

export default getRents;
