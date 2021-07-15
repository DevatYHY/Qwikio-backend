import DonationData from "../../types/GetDonationType";
import { Donation } from "../../models";

const getDonations = {
    type: DonationData,

    async resolve({ request }) {
        try {
            const records = await Donation.findAll();
         
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

export default getDonations;
