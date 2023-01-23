﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Infraestructure
{
    public  interface IConnectionFactory
    {

        IDbConnection GetConnection { get; }
    }
}
