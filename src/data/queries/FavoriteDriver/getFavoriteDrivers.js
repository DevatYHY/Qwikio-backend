import FavoriteDriverData from '../../types/getFavoriteDriverType';
import { FavoriteDriver, UserProfile } from '../../../data/models';


const getFavoriteDrivers = {

    type: FavoriteDriverData,

    async resolve({ request, response }) {
        try {
            if (request.user) {
                let userId = request.user.id;
                const favoritedrivers = await FavoriteDriver.findAll({
                    where: { userId },
                });
                for (const obj of favoritedrivers) {
                    let driverProfile = await UserProfile.findOne({
                        where: { userId: obj['driverId'] },
                    });
                    obj.driverName = driverProfile ? driverProfile.firstName + ' ' + driverProfile.lastName : '';
                }

                if (favoritedrivers) {
                    return {
                        results: favoritedrivers,
                        status: 200
                    }
                } else {
                    return {
                        status: 400,
                        errorMessage: "Something Went Wrong"
                    }
                }
            } else {
                return {
                    status: 500,
                    errorMessage: 'Oops! Please login with your account and try again.'
                }
            }

        } catch (error) {
            return {
                errorMessage: 'Something went wrong' + error,
                status: 400
            };
        }

    }
};

export default getFavoriteDrivers;
