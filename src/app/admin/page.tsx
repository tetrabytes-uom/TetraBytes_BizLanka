import { getServerSession } from 'next-auth';
import React from 'react';

export default async function page() {
  const session = await getServerSession(authOptions);
  return <div>Welcome to admin</div>;
}
