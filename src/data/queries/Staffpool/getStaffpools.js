import StaffpoolData from "../../types/GetStaffpoolType";
import { Staffpool } from "../../models";

const getStaffpools = {
    type: StaffpoolData,

    async resolve({ request }) {
        try {
            const records = await Staffpool.findAll();
         
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

export default getStaffpools;
