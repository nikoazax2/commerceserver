
import { Injectable, UnauthorizedException } from '@nestjs/common';
import { UsersService } from '../users/users.service';
import { JwtService } from '@nestjs/jwt';
import { Logger } from '@nestjs/common'; 

@Injectable()
export class AuthService {
    constructor(
        private usersService: UsersService, 
        private jwtService: JwtService
    ) { }

    async signIn(email, pass, code = null) {

        const user = await this.usersService.findOne(email);
        Logger.log(JSON.stringify(user))
        Logger.log((user?.password !== pass || user?.code !== code) || user?.activated == false)

        if ((pass == null && user?.code !== code) ||
            user?.activated == false ||
            (code == null && user?.password !== pass)) {


            throw new UnauthorizedException();
        }

        const payload = { uuid: user.uuid, username: user.username, email: user.email, adress: user.adress, role: user.role }

        return {
            access_token: await this.jwtService.signAsync(payload),
        };
    }
}