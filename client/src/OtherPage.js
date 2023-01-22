import React from 'react';
import { Link } from 'react-router-dom';

const OtherPage = () => {
    return (
        <div>
            In some other page!
            <Link to="/">Back home</Link>
        </div>
    )
};

export default OtherPage;