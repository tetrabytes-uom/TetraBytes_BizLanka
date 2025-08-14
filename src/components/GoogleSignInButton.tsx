import { FC, ReactNode } from 'react';
import Image from 'next/image';
import { Button } from './ui/button';

interface GoogleSignInButtonProps {
  children: ReactNode;
}

const GoogleSignInButton: FC<GoogleSignInButtonProps> = ({ children }) => {
  const loginWithGoogle = () => console.log('login with google');

  return (
    <Button
      onClick={loginWithGoogle}
      className="w-full flex items-center gap-2"
    >
      <Image
        src="/icons/google-color.svg"
        alt="Google"
        width={20}
        height={20}
      />
      {children}
    </Button>
  );
};

export default GoogleSignInButton;
