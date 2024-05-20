import { authConfig } from "@/pages/api/auth/[...nextauth]"
import { Session, getServerSession } from "next-auth"
import { LogoutButton } from "@/src/auth/LogoutButton";
import '@/app/globals.css';
import Image from 'next/image';


export const User = async () => {
    const session = await getServerSession(authConfig);
    if(!session?.user){
        return <p>No user</p>
    }

    return (
        <div>
            {session.user.image && (
                <img 
                    src={session.user.image ?? ''} 
                    alt="User Image"
                    width="50" // Définissez la largeur souhaitée
                    height="50" // Définissez la hauteur souhaitée
                    style={{ borderRadius: '50%' }} // Optionnel: pour un aspect rond
                />
                )}
            <p>{session.user.name}</p>
        </div>
    )
}